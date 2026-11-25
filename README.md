# Nginx Log Analyzer

A shell script that analyzes an Nginx access log and displays:

- Top 5 IP addresses with the most requests
- Top 5 requested paths
- Top 5 response status codes
- Top 5 user agents

## Requirements

- Linux
- Bash

## Usage

Make the script executable:

```bash
chmod +x nginx-log-analyzer.sh
```

Run:

```bash
./nginx-log-analyzer.sh access.log
```

## Features

- Analyze access logs
- Count requests by IP
- Count requests by path
- Count response status codes
- Count user agents

## Project URL

https://roadmap.sh/projects/nginx-log-analyser
