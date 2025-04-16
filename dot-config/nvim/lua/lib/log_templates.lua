return {
  javascript = 'norm oconsole.log("%s: ", %s);',
  apex = "norm oSystem.debug(String.format('%s: {0}', new List<String>{String.valueOf(%s)}));",
}
