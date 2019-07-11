connection: "azuresqldb_vbisqldb_srt"

# include all the views
include: "*.view"

datagroup: srt_ram_tryout_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: srt_ram_tryout_default_datagroup

explore: match_info {}

explore: sachin_details {
  join: match_info
  {
    type:  inner
    relationship: many_to_one
    sql_on: ${sachin_details.match_id} = ${match_info.match_id} ;;
  }
  join: stadium_info
  {
    type:  inner
    relationship: one_to_one
    sql_on: ${stadium_info.stadium_id} = ${match_info.stadium_id} ;;
  }
}

explore: stadium_info {
  join: match_info {
    type:  inner
    relationship: many_to_one
    sql_on: ${stadium_info.stadium_id} = ${match_info.stadium_id}  ;;
  }
}
