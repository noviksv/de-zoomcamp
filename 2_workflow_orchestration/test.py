from prefect import flow, task

@task(log_prints=True, retries=3)
def print_task():
    print("123")

@flow(name="Ingest Flow")
def main():
    print("Flow started")
    print_task()

if __name__ == "__main__":
    main()

