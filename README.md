# streamlit-container
Containerized Streamlit for x86 and arm64 (Jetson, l4t)

# Build

    docker build -t zauberzeug/streamlit:latest .

# Run

    docker run --rm -p 80:80 -it zauberzeug/streamlit:latest

Add the parameter `-v "$(pwd)"/main.py:/app/main.py` to bind your local `main.py` into the container.