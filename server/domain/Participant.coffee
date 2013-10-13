class Participant
  constructor: (config) ->
    super config
    @firstName = config.firstName
    @middleName = config.middleName
    @lastName = config.lastName
    @role = config.role
    @team = config.team
    @contactInfo = config.contactInfo

module.exports = Participant