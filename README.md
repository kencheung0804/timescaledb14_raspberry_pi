# Step By Step

**Step 1: Build the custome Docker Image**
```bash
docker build -t custom-timescaledb
```

**Step2: Run the new container with the custom image:**
```bash
docker run -d --name timescaledb \
  -p 5432:5432 \
  -e POSTGRES_PASSWORD=your_password \
  -v timescale_data:/var/lib/postgresql/data \
  custom-timescaledb
```
