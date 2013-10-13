class Team
  constructor: (config) ->
    super config
    @name = config.name
    @coaches = config.coaches
    @competitors = config.competitors

module.exports = Team