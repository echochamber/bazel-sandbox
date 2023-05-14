use actix_web::{get, post, web, App, HttpResponse, HttpServer, Responder};

use dotenv;

pub mod libs;

#[get("/")]
async fn hello() -> impl Responder {
    HttpResponse::Ok().body("Hello world!")
}

#[post("/echo")]
async fn echo(req_body: String) -> impl Responder {
    HttpResponse::Ok().body(req_body)
}

#[get("/postgres")]
async fn postgres(_req_body: String) -> impl Responder {
    match libs::postgres::init_pg_pool().await {
        Ok(pool) => {
            let result = libs::postgres::get_movie(pool).await.unwrap();
            return HttpResponse::Ok().body(result.0.to_string());
        }
        other @ _ => {
            if other.is_err() {
                return HttpResponse::Ok().body(other.unwrap_err().to_string());
            }
        }
    }

    return HttpResponse::Ok().body("This shouldn't be hit.");
}

async fn manual_hello() -> impl Responder {
    HttpResponse::Ok().body("Hey there!")
}

#[actix_web::main]
async fn main() -> std::io::Result<()> { 
    println!("Initiating server");
    dotenv::dotenv().ok();
    HttpServer::new(|| {
        App::new()
            .service(hello)
            .service(echo)
            .service(postgres)
            .route("/hey", web::get().to(manual_hello))
    })
    .bind(("0.0.0.0", 8080))?
    .run()
    .await
}
