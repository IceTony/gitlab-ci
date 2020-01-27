#!/bin/bash
echo "################# Start tests #################"

echo "##### Lint"
pylint lib/calc.py lib/db.py calc2.py

echo "##### Unit testing"
python tests/unit_test.py

echo "##### Smoke testing"
curl 127.0.0.1:5000

echo "##### API, Integration and Interface testing"
curl -d "operation=15,*,3" -X POST http://localhost:5000/calc
curl -d "operation=15,-,3" -X POST http://localhost:5000/calc
curl -d "operation=15,/,3" -X POST http://localhost:5000/calc
curl 127.0.0.1:5000/results_secret
curl -X POST http://localhost:5000/cleanup

echo "##### Load testing"
ab -n 10000 -c 10 http://127.0.0.1:5000/
