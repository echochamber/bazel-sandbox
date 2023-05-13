use rs_js_shared::postgres;
use dotenv::dotenv;


#[tokio::main]
async fn main() -> () {
    dotenv().ok();
    // Open a connection to the mini-redis address.
    println!("Hello, world!");
    let pool = postgres::init_pg_pool().await.unwrap();
    let result = postgres::get_movie(pool).await;
    match result {
        Ok(inner) => assert_eq!(inner.0, 150),
        Err(e) => println!("Postgres error {:?}", e.to_string())
    }


    return ();
}