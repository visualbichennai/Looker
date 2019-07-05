view: sachin_details {
  sql_table_name: SRT.Sachin_Details ;;

  dimension: balls {
    type: number
    sql: ${TABLE}.BALLS ;;
  }

  dimension: batting_position {
    type: number
    sql: ${TABLE}.BATTING_POSITION ;;
  }

  dimension: bowling {
    type: string
    sql: ${TABLE}.BOWLING ;;
  }

  dimension: fours {
    type: number
    sql: ${TABLE}.FOURS ;;
  }

  dimension: innings {
    type: number
    sql: ${TABLE}.INNINGS ;;
  }

  dimension: match_id {
    type: number
    sql: ${TABLE}.MATCH_ID ;;
  }

  dimension: minutes {
    type: number
    sql: ${TABLE}.MINUTES ;;
  }

  dimension: out_type {
    type: string
    sql: ${TABLE}.OUT_TYPE ;;
  }

  dimension: runs {
    type: number
    sql: ${TABLE}.RUNS ;;
  }

  dimension: second_player {
    type: string
    sql: ${TABLE}.SECOND_PLAYER ;;
  }

  dimension: sixes {
    type: number
    sql: ${TABLE}.SIXES ;;
  }


  dimension: strikeratecalc {
    type: yesno
    sql: ${balls} != 0 ;;
    hidden: yes
  }

  dimension: strikerate {
    type: number
    sql: (CASE WHEN ${strikeratecalc} THEN ((${runs}*100)/${balls}) else 0 end) ;;
  }

  measure: overallruns {
    type: sum
    sql:  ${TABLE}.RUNS ;;
  }

  measure: overallballs {
    type: sum
    sql:  ${TABLE}.BALLS ;;
  }

  measure: overallstrikerate {
    sql: ${overallruns}*100/${overallballs} ;;
  }



  measure: boundary_runs
  {
    type: sum
    sql:  ${fours}*4 + ${sixes}*6;;
  }

  measure: average_runs
  {
    type: average
    sql: ${runs} ;;
  }

  measure: highest_score
  {
    type: max
    sql: ${runs} ;;
  }

  measure: lowest_score
  {
    type: min
    sql: ${runs} ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
