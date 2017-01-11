view: xero_saas_metrics {
  sql_table_name: growthwise.xero_saas_metrics ;;

   measure: arpc {
    group_label: "SaaS Metrics"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.arpc ;;
  }

  measure: cac {
    group_label: "SaaS Metrics"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.cac ;;
  }

  measure: churn_rate {
    group_label: "SaaS Metrics"
    type: number
    sql: ${TABLE}.churn_rate ;;
  }

  measure: churned_mrr {
    group_label: "MRR"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.churned_mrr ;;
  }

  measure: coc {
    group_label: "SaaS Metrics"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.coc ;;
  }

  measure: cost_of_goods_sold {
    group_label: "Finance"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.cost_of_goods_sold ;;
  }

  dimension_group: curr_month {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.curr_month ;;
  }

  measure: downgraded_mrr {
    group_label: "MRR"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.downgraded_mrr ;;
  }

  measure: expansion_mrr {
    group_label: "MRR"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.expansion_mrr ;;
  }

  measure: gross_margin {
    group_label: "Finance"
    type: sum
    value_format_name: percent_2
    sql: ${TABLE}.gross_margin ;;
  }

  measure: LTV {
    group_label: "SaaS Metrics"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.ltv ;;
  }

  measure: ltv_cac_ratio {
    group_label: "SaaS Metrics"
    type: sum
    value_format_name: decimal_3
    sql: ${TABLE}.ltv  / ${TABLE}.cac ;;
  }

  measure: months_to_recover_cac {
    group_label: "SaaS Metrics"
    type: sum
    value_format_name: decimal_3
    sql: ${TABLE}.cac  / ${TABLE}.arpc ;;
  }

  measure: net_mrr {
    group_label: "MRR"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.net_mrr ;;
  }

  measure: new_mrr {
    group_label: "MRR"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.new_mrr ;;
  }

  measure: revenue {
    group_label: "Finance"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.revenue ;;
  }

  measure: revenue_per_employee {
    group_label: "SaaS Metrics"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.revenue_per_employee ;;
  }

  measure: prod_revenue_per_employee {
    group_label: "SaaS Metrics"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.prod_rev_per_employee ;;
  }

  measure: saas_magic_number {
    group_label: "SaaS Metrics"
    type: sum
    sql: ${TABLE}.saas_magic_number ;;
  }

  measure: saas_quick_ratio {
    group_label: "SaaS Metrics"
    type: sum
    sql: ${TABLE}.saas_quick_ratio ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
