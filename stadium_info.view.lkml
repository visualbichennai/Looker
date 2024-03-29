view: stadium_info {
  sql_table_name: SRT.Stadium_Info ;;

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.COUNTRY ;;
  }

  dimension: stadium_id {
    type: number
    sql: ${TABLE}.STADIUM_ID ;;
  }

  dimension: stadium_name {
    type: string
    sql: ${TABLE}.STADIUM_NAME ;;
  }

  dimension: stadium_place {
    type: string
    sql: ${TABLE}.STADIUM_PLACE ;;
  }

  dimension: homaway {
    type: yesno
    sql: ${TABLE}.COUNTRY = 'India'   ;;
    hidden: yes
}

  dimension: venue {
    sql: (CASE WHEN ${homaway} THEN 'Home' else 'Away' end)  ;;
  }

  measure: count {
    type: count
    drill_fields: [stadium_name]
  }
}
