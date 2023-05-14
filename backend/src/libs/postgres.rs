use std::env;
use sqlx::postgres::PgPoolOptions;
use sqlx::PgPool;



/// Represents all the ways a method can fail within SQLx.
#[derive(Debug, thiserror::Error)]
#[non_exhaustive]
pub enum Error {
    #[error("Error getting env var: {0}")]
    EnvVarError(env::VarError),
    #[error("Error from SQLx: {0}")]
    SqlxError(sqlx::Error),
    #[error("Unknown error")]
    Other
}

impl From<sqlx::Error> for Error {
    fn from(e: sqlx::Error) -> Self {
        Error::SqlxError(e)
    }
}
impl From<env::VarError> for Error {
    fn from(e: env::VarError) -> Self {
        Error::EnvVarError(e)
    }
}

pub fn db_url_from_envars() -> Result<String, Error> {
    Ok(format!(
        "postgres://{user}:{pw}@{host}/{db}",
        user = env::var("POSTGRES_USER")?,
        pw = env::var("POSTGRES_PASSWORD")?,
        host = env::var("POSTGRES_HOST")?,
        db = env::var("POSTGRES_DBNAME")?))
}

pub async fn init_pg_pool() -> Result<PgPool, Error> {
    println!("Connecting to postgres at {:?}", db_url_from_envars());
    let pool = PgPoolOptions::new()
    .max_connections(5)
    .connect(&db_url_from_envars()?).await?;
    Ok(pool)
}

pub async fn get_movie(pool: PgPool) -> Result<(i64,), Error> {

    // Make a simple query to return the given parameter (use a question mark `?` instead of `$1` for MySQL)
    let row: (i64,) = sqlx::query_as("SELECT $1")
        .bind(150_i64)
        .fetch_one(&pool).await?;

    println!("{:?} value from db", row.0);

    Ok(row)
}

#[sqlx::test]
async fn basic_test(pool: PgPool) -> Result<(), Error> {
    // println!("Hello {:?}", db_url_from_envars()?);
    // env::set_var("DATABASE_URL", db_url_from_envars()?);
    let result = get_movie(pool).await?;
    assert_eq!(result.0, 150);
    Ok(())
}