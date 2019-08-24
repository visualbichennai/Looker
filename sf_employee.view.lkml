view: sf_employee {
  sql_table_name: COE_TRYOUTS.SF_EMPLOYEE ;;

  dimension: address {
    type: string
    sql: ${TABLE}."ADDRESS" ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}."CITY" ;;
  }

  dimension_group: date_of_join {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATE_OF_JOIN" ;;
  }

  dimension: emailid {
    type: string
    sql: ${TABLE}."EMAILID" ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}."FIRST_NAME" ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}."LAST_NAME" ;;
  }

  measure: count {
    type: count
    drill_fields: [first_name, last_name]
  }
}
