view: xero_change_in_mrr {
  sql_table_name: growthwise.xero_change_in_mrr ;;

  dimension: cmrr {
    hidden: yes
    label: "Change in MRR"
    type: number
    value_format_name: usd
    sql: ${TABLE}.cmrr ;;
  }

  dimension: contact_name {
    label: "Client Group"
    type: string
    sql: ${TABLE}.contact_name ;;
  }

  dimension_group: curr_month {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.curr_month ;;
  }

  dimension: curr_mrr {
    label: "Current MRR"
    type: number
    value_format_name: usd
    sql: ${TABLE}.curr_mrr ;;
  }

  dimension: mrr_type {
    type: string
    sql: ${TABLE}.mrr_type ;;
  }

  dimension_group: prev_month {
    type: time
    hidden: yes
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.prev_month ;;
  }

  dimension: prev_mrr {
    type: number
    hidden: yes
    sql: ${TABLE}.prev_mrr ;;
  }

  measure: new_mrr {
    label: "New MRR"
    type: sum
    sql: ${cmrr} ;;
    value_format_name: usd

    filters: {
      field: mrr_type
      value: "New"
    }

    filters: {
      field: cmrr
      value: ">0"
    }

    drill_fields: [contact_name, cmrr, curr_mrr]
  }

  measure: churned_mrr {
    label: "Churned MRR"
    type: sum
    sql: ${cmrr} ;;
    value_format_name: usd

    filters: {
      field: mrr_type
      value: "Churned"
    }

    drill_fields: [contact_name, cmrr, curr_mrr]
  }

  measure: downgraded_mrr {
    label: "Downgraded MRR"
    type: sum
    sql: ${cmrr} ;;
    value_format_name: usd

    filters: {
      field: mrr_type
      value: "Downgrade"
    }

    drill_fields: [contact_name, cmrr, curr_mrr]
  }

  measure: expansion_mrr {
    label: "Expansion MRR"
    type: sum
    sql: ${cmrr} ;;
    value_format_name: usd

    filters: {
      field: mrr_type
      value: "Expansion"
    }

    drill_fields: [contact_name, cmrr, curr_mrr]
  }

  measure: total_mrr_change {
    #  hidden: true
    type: sum
    value_format_name: usd
    sql: ${cmrr} ;;
  }

  measure: total_mrr {
    #  hidden: true
    type: sum
    value_format_name: usd
    sql: ${curr_mrr} ;;
  }

  #- measure: churned_mrr_pct
  #  hidden: true
  #  type: sum
  #  value_format_name: percent_2
  #  sql: (${churned_mrr}/${curr_mrr})*-1

  measure: net_mrr {
    type: sum
    value_format_name: usd
    sql: ${cmrr} ;;
  }

  #  drill_fields: detail*

  measure: count {
    type: count
    drill_fields: [contact_name]
  }
}
