FROM python:3.10

WORKDIR /app

RUN apt-get update && apt-get install -y libgomp1 && rm -rf /var/lib/apt/lists/*

COPY . .

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

CMD streamlit run app.py --server.port $PORT --server.address 0.0.0.0
