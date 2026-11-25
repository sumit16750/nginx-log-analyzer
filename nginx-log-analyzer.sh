#!/bin/bash

# ============================================
# NGINX LOG ANALYZER
# ============================================

# Check arguments
if [ $# -ne 1 ]; then
    echo "Usage: $0 <nginx_access_log>"
    exit 1
fi

LOGFILE="$1"

# Check if file exists
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File '$LOGFILE' does not exist."
    exit 1
fi

echo "======================================"
echo "        NGINX LOG ANALYZER"
echo "======================================"

# --------------------------------------------
# Top 5 IP Addresses
# --------------------------------------------

echo ""
echo "Top 5 IP Addresses with Most Requests"
echo "--------------------------------------"

awk '{print $1}' "$LOGFILE" |
sort |
uniq -c |
sort -rn |
head -5 |
awk '{printf "%-20s %s requests\n",$2,$1}'

# --------------------------------------------
# Top 5 Requested Paths
# --------------------------------------------

echo ""
echo "Top 5 Most Requested Paths"
echo "--------------------------------------"

awk -F'"' '{print $2}' "$LOGFILE" |
awk '{print $2}' |
sort |
uniq -c |
sort -rn |
head -5 |
awk '{printf "%-40s %s requests\n",$2,$1}'

# --------------------------------------------
# Top 5 Status Codes
# --------------------------------------------

echo ""
echo "Top 5 Response Status Codes"
echo "--------------------------------------"

awk '{print $9}' "$LOGFILE" |
sort |
uniq -c |
sort -rn |
head -5 |
awk '{printf "%-10s %s requests\n",$2,$1}'

# --------------------------------------------
# Top 5 User Agents
# --------------------------------------------

echo ""
echo "Top 5 User Agents"
echo "--------------------------------------"

awk -F'"' '{print $6}' "$LOGFILE" |
sort |
uniq -c |
sort -rn |
head -5 |
while read count agent
do
    echo "$agent - $count requests"
done

echo ""
echo "======================================"
echo "Analysis Complete"
echo "======================================"
