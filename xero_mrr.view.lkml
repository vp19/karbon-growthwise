view: xero_mrr {
  sql_table_name: growthwise.xero_mrr ;;

  dimension: amount {
    #hidden: true
    type: number
    value_format_name: usd
    sql: ${TABLE}.amount ;;
  }

  dimension: contact_name {
    type: string
    sql: ${TABLE}.contact_name ;;
  }

  dimension: client_group {
    type: string
    sql: ${TABLE}.client_group ;;
  }

  dimension_group: invoice_month_tz {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.invoice_month ;;
  }

  dimension_group: invoice_month {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.invoice_month ;;
  }

  measure: mrr {
    type: sum
    value_format_name: usd
    sql: ${amount} ;;
    drill_fields: [client_group, contact_name, amount, invoice_month_tz.date]
  }

  measure: number_of_clients {
    type: count_distinct
    sql: ${contact_name} ;;
    drill_fields: [client_group, contact_name, amount, invoice_month_tz.date]
  }

  measure: number_of_client_groups {
    type: count_distinct
    sql: ${client_group} ;;
    drill_fields: [client_group, contact_name, amount, invoice_month_tz.date]
  }

  measure: count {
    type: count
    drill_fields: [contact_name]
  }
}
