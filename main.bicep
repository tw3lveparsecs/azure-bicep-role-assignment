targetScope = 'subscription'

@description('Role assignment name')
param name string
@description('The principal Id')
param principalId string
@description('The builtin role for the role assignment')
@allowed([
  'Owner'
  'Contributor'
  'Reader'
  'Custom'
])
param builtinRole string
@description('Role definition Id in format of "/providers/Microsoft.Authorization/roleDefinitions/<id>". Only required when builtin role is custom')
param roleDefinitionId string = ''

resource role 'Microsoft.Authorization/roleAssignments@2020-04-01-preview' = {
  name: guid(name)
  properties: {
    principalId: principalId
    roleDefinitionId: builtinRole == 'Owner' ? '/providers/Microsoft.Authorization/roleDefinitions/8e3af657-a8ff-443c-a75c-2fe8c4bcb635' : builtinRole == 'Contributor' ? '/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c' : builtinRole == 'Reader' ? '/providers/Microsoft.Authorization/roleDefinitions/acdd72a7-3385-48ef-bd42-f606fba81ae7' : roleDefinitionId
  }
}
