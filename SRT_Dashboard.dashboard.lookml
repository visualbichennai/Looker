- dashboard: srt_dashboard_from_development
  title: SRT_Dashboard_Ram_Development
  layout: newspaper
  elements:
  - title: Highest Score
    name: Highest Score
    model: srt_ram_tryout
    explore: sachin_details
    type: single_value
    fields: [sachin_details.highest_score]
    limit: 500
    series_types: {}
    listen:
      Country Against: match_info.against
    row: 0
    col: 0
    width: 4
    height: 3
  - title: Average Score
    name: Average Score
    model: srt_ram_tryout
    explore: sachin_details
    type: single_value
    fields: [sachin_details.average_runs]
    limit: 500
    listen:
      Country Against: match_info.against
    row: 0
    col: 8
    width: 4
    height: 3
  - title: Lowest Score
    name: Lowest Score
    model: srt_ram_tryout
    explore: sachin_details
    type: single_value
    fields: [sachin_details.lowest_score]
    limit: 500
    listen:
      Country Against: match_info.against
    row: 0
    col: 4
    width: 4
    height: 3
  - title: Strike Rate
    name: Strike Rate
    model: srt_ram_tryout
    explore: sachin_details
    type: single_value
    fields: [sachin_details.overallstrikerate]
    limit: 500
    series_types: {}
    listen:
      Country Against: match_info.against
    row: 0
    col: 16
    width: 3
    height: 3
  - title: Total Runs
    name: Total Runs
    model: srt_ram_tryout
    explore: sachin_details
    type: single_value
    fields: [sachin_details.overallruns]
    limit: 500
    listen:
      Country Against: match_info.against
    row: 0
    col: 12
    width: 4
    height: 3
  - title: Home vs Away Runs Scored
    name: Home vs Away Runs Scored
    model: srt_ram_tryout
    explore: sachin_details
    type: table
    fields: [stadium_info.venue, sachin_details.overallruns]
    limit: 500
    series_types: {}
    listen:
      Country Against: match_info.against
    row: 3
    col: 0
    width: 6
    height: 3
  - title: Runs Against Countries
    name: Runs Against Countries
    model: srt_ram_tryout
    explore: sachin_details
    type: looker_bar
    fields: [sachin_details.overallruns, match_info.against]
    sorts: [sachin_details.overallruns desc]
    limit: 500
    series_types: {}
    up_color: "#3EB0D5"
    down_color: "#B1399E"
    total_color: "#C2DD67"
    listen:
      Country Against: match_info.against
    row: 3
    col: 6
    width: 10
    height: 6
  - title: Man of the Match Awards
    name: Man of the Match Awards
    model: srt_ram_tryout
    explore: sachin_details
    type: single_value
    fields: [match_info.man_of_the_match, sachin_details.count]
    filters:
      match_info.man_of_the_match: SR Tendulkar
    sorts: [match_info.man_of_the_match]
    limit: 500
    series_types: {}
    listen:
      Country Against: match_info.against
    row: 0
    col: 19
    width: 5
    height: 3
  - title: Overall Balls Faced
    name: Overall Balls Faced
    model: srt_ram_tryout
    explore: sachin_details
    type: single_value
    fields: [sachin_details.overallballs]
    limit: 500
    series_types: {}
    listen:
      Country Against: match_info.against
    row: 6
    col: 0
    width: 6
    height: 3
  - title: Outs Against Bowlers
    name: Outs Against Bowlers
    model: srt_ram_tryout
    explore: sachin_details
    type: looker_funnel
    fields: [sachin_details.bowling, sachin_details.count]
    filters:
      sachin_details.bowling: -"NULL"
    sorts: [sachin_details.count desc]
    limit: 10
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: 471a8295-662d-46fc-bd2d-2d0acd370c1e
      options:
        steps: 5
        reverse: true
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: hidden
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    series_types: {}
    listen:
      Country Against: match_info.against
    row: 3
    col: 16
    width: 8
    height: 6
  filters:
  - name: Country Against
    title: Country Against
    type: field_filter
    default_value: Australia
    allow_multiple_values: true
    required: false
    model: srt_ram_tryout
    explore: match_info
    listens_to_filters: []
    field: match_info.against
