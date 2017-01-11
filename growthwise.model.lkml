connection: "growthwise_postgres_datamart"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: xero_mrr {}

explore: xero_change_in_mrr {}

explore: invoices {}

explore:  xero_saas_metrics {}
