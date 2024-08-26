FROM python:3.12-slim

WORKDIR /app

RUN python -m venv venv

RUN . venv/bin/activate

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["flask", "run", "--host=0.0.0.0"]