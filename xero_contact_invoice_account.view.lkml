view: invoices {
  sql_table_name: growthwise.xero_contact_invoice_account ;;

  dimension: account_class {
    group_label: "Account"
    type: string
    sql: ${TABLE}.account_class ;;
  }

  dimension: account_code {
    group_label: "Account"
    type: string
    sql: ${TABLE}.account_code ;;
  }

  dimension: account_group {
    group_label: "Account"
    label: "Account Group"
    type: string
    sql: CASE WHEN ${account_code} = '135' THEN 'Compliance'
           WHEN ${account_code} = '130' THEN 'SMSF'
           WHEN ${account_code} = '124' THEN 'Compliance'
           WHEN ${account_code} = '140' THEN 'Compliance'
           WHEN ${account_code} = '110' THEN 'Management'
           WHEN ${account_code} = '108' THEN 'Management'
           WHEN ${account_code} = '109' THEN 'Management'
           WHEN ${account_code} = '121' THEN 'Technology'
           WHEN ${account_code} = '120' THEN 'Technology'
           WHEN ${account_code} = '122' THEN 'Technology'
           WHEN ${account_code} = '101' THEN 'Compliance'
           ELSE 'Other'
      END
       ;;
  }

  dimension: account_name {
    group_label: "Account"
    type: string
    sql: ${TABLE}.account_name ;;
  }

  dimension: account_src {
    hidden: yes
    type: string
    sql: ${TABLE}.account_src ;;
  }

  dimension: account_status {
    group_label: "Account"
    type: string
    sql: ${TABLE}.account_status ;;
  }

  dimension: account_type {
    group_label: "Account"
    type: string
    sql: ${TABLE}.account_type ;;
  }

  dimension: revenue_stream {
    group_label: "Account"
    type: string
    sql: CASE WHEN ${account_code} = '135' THEN 'MRR'
           WHEN ${account_code} = '130' THEN 'MRR'
           WHEN ${account_code} = '124' THEN 'MRR'
           WHEN ${account_code} = '140' THEN 'MRR'
           WHEN ${account_code} = '110' THEN 'MRR'
           WHEN ${account_code} = '108' THEN 'MRR'
           WHEN ${account_code} = '109' THEN 'MRR'
           WHEN ${account_code} = '121' THEN 'MRR'
           WHEN ${account_code} = '120' THEN 'MRR'
           WHEN ${account_code} = '122' THEN 'MRR'
           WHEN ${account_code} = '101' THEN 'MRR'
           WHEN ${account_code} = '102' THEN 'Other Revenue'
           WHEN ${account_code} = '145' THEN 'Other Revenue'
           WHEN ${account_code} = '150' THEN 'Other Revenue'
           WHEN ${account_code} = '103' THEN 'Other Revenue'
           WHEN ${account_code} = '131' THEN 'Other Revenue'
           ELSE 'Not sure'
      END
       ;;
  }

  dimension: contact_name {
    group_label: "Contact"
    type: string
    sql: ${TABLE}.contact_name ;;
  }

  dimension: contact_src {
    hidden: yes
    type: string
    sql: ${TABLE}.contact_src ;;
  }

  dimension: contact_status {
    group_label: "Contact"
    type: string
    sql: ${TABLE}.contact_status ;;
  }

  dimension: currency_code {
    group_label: "Invoice"
    type: string
    sql: ${TABLE}.currency_code ;;
  }

  dimension: currency_rate {
    group_label: "Invoice"
    type: number
    sql: ${TABLE}.currency_rate ;;
  }

  dimension: discount_rate {
    hidden: yes
    type: number
    sql: ${TABLE}.discount_rate ;;
  }

  dimension: email {
    group_label: "Contact"
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    group_label: "Contact"
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension_group: fully_paid_on {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.fully_paid_on_date ;;
  }

  dimension_group: fully_paid_on_date_tz {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.fully_paid_on_date_tz ;;
  }

  dimension: inv_line_item_src {
    type: string
    sql: ${TABLE}.inv_line_item_src ;;
  }

  dimension_group: invoice {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.invoice_date ;;
  }

  dimension_group: invoice_month_tz {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.invoice_month_tz ;;
  }

  dimension_group: invoice_month {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.invoice_month ;;
  }

  dimension: invoice_number {
    group_label: "Invoice"
    type: string
    sql: ${TABLE}.invoice_number ;;
  }

  dimension: invoice_src {
    hidden: yes
    type: string
    sql: ${TABLE}.invoice_src ;;
  }

  dimension: invoice_status {
    group_label: "Invoice"
    type: string
    sql: ${TABLE}.invoice_status ;;
  }

  dimension: invoice_sub_total {
    hidden: yes
    type: number
    sql: ${TABLE}.invoice_sub_total ;;
  }

  dimension: invoice_total {
    hidden: yes
    type: number
    sql: ${TABLE}.invoice_total ;;
  }

  dimension: is_customer {
    group_label: "Contact"
    type: yesno
    sql: ${TABLE}.is_customer ;;
  }

  dimension: is_supplier {
    group_label: "Contact"
    type: yesno
    sql: ${TABLE}.is_supplier ;;
  }

  dimension: item_code {
    hidden: yes
    type: string
    sql: ${TABLE}.item_code ;;
  }

  dimension: last_name {
    group_label: "Contact"
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: line_item_amount {
    hidden: yes
    type: number
    value_format_name: usd
    sql: ${TABLE}.line_item_amount ;;
  }

  dimension: quantity {
    hidden: yes
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: tax_amount {
    hidden: yes
    type: number
    sql: ${TABLE}.tax_amount ;;
  }

  dimension: unit_amount {
    hidden: yes
    type: number
    sql: ${TABLE}.unit_amount ;;
  }

  measure: amount {
    type: sum
    value_format_name: usd
    sql: ${line_item_amount} ;;
    drill_fields: [contact_name, first_name, last_name, account_name, line_item_amount]
  }

  measure: amount_mrr {
    label: "MRR"
    type: sum
    value_format_name: usd

    filters: {
      field: revenue_stream
      value: "MRR"
    }

    sql: ${line_item_amount} ;;
    drill_fields: [contact_name, first_name, last_name, account_name, line_item_amount]
  }

  measure: amount_tax_revenue {
    label: "Tax Revenue"
    type: sum
    value_format_name: usd

    filters: {
      field: revenue_stream
      value: "Tax Revenue"
    }

    sql: ${line_item_amount} ;;
    drill_fields: [contact_name, first_name, last_name, account_name, line_item_amount]
  }

  measure: amount_non_recurring {
    label: "Non Recurring"
    type: sum
    value_format_name: usd

    filters: {
      field: revenue_stream
      value: "Non Recurring"
    }

    sql: ${line_item_amount} ;;
    drill_fields: [contact_name, first_name, last_name, account_name, line_item_amount]
  }

  measure: amount_other_revenue {
    label: "Other Revenue"
    type: sum
    value_format_name: usd

    filters: {
      field: revenue_stream
      value: "Other Revenue"
    }

    sql: ${line_item_amount} ;;
    drill_fields: [contact_name, first_name, last_name, account_name, line_item_amount]
  }

  measure: amount_billed_pass_thru {
    label: "Billed Pass-Through Revenue"
    type: sum
    value_format_name: usd

    filters: {
      field: revenue_stream
      value: "Billed Pass-Through Revenue"
    }

    sql: ${line_item_amount} ;;
    drill_fields: [contact_name, first_name, last_name, account_name, line_item_amount]
  }

  measure: amount_older_revenue_streams {
    label: "Older Revenue Streams"
    type: sum
    value_format_name: usd

    filters: {
      field: revenue_stream
      value: "Older Revenue Streams"
    }

    sql: ${line_item_amount} ;;
    drill_fields: [contact_name, first_name, last_name, account_name, line_item_amount]
  }

  measure: number_of_clients {
    type: count_distinct
    sql: ${contact_name} ;;
  }

  measure: number_of_mrr_clients {
    type: count_distinct

    filters: {
      field: revenue_stream
      value: "MRR"
    }

    sql: ${contact_name} ;;
  }

  measure: count {
    type: count
    drill_fields: [contact_name, first_name, last_name, account_name]
  }
}
