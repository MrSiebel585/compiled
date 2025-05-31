#!/bin/bash

# This script analyzes system logs for errors and warnings and generates a report

# Define environment variables
LOG_FILES="/var/log/syslog /var/log/auth.log /var/log/kern.log"
REPORT_FILE="log_analysis_$(date +%Y%m%d).txt"
ERROR_THRESHOLD=10
WARNING_THRESHOLD=50

# Define user-defined functions
function get_error_count {
  # Returns the number of error messages in the logs
  grep -c "error" $LOG_FILES
}

function get_warning_count {
  # Returns the number of warning messages in the logs
  grep -c "warning" $LOG_FILES
}

# Define main function
function main {
  # Initializes variables and generates report based on error and warning counts
  local error_count=$(get_error_count)
  local warning_count=$(get_warning_count)
  
  echo "Log analysis report for $(date +%Y-%m-%d):" > $REPORT_FILE
  echo "--------------------------------------------------" >> $REPORT_FILE
  echo "Error count: $error_count" >> $REPORT_FILE
  if (( error_count > ERROR_THRESHOLD )); then
    echo "ERROR: High number of errors detected. Please investigate." >> $REPORT_FILE
  else
    echo "No critical errors detected." >> $REPORT_FILE
  fi
  
  echo "Warning count: $warning_count" >> $REPORT_FILE
  if (( warning_count > WARNING_THRESHOLD )); then
    echo "WARNING: High number of warnings detected. Please investigate." >> $REPORT_FILE
  else
    echo "No critical warnings detected." >> $REPORT_FILE
  fi
  
  echo "Report generated successfully. Please see $REPORT_FILE for details."
}

# Call the main function
main