class Meet
  constructor: (config) ->
    super config
    @name = config.name
    @date = config.date
    @location = config.location
    @teams = config.teams

module.exports = Meet