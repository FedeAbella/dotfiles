return {
    s(
        {
            trig = 'testadmin',
            docstring = 'Boilerplate for running a test as a test admin user',
        },
        {
            t('User admin = [SELECT Id FROM User WHERE Username = :TestDataFactory.ADMIN_USERNAME];'),
            t({ '', 'System.runAs(admin) {' }),
            t({ '', '    ' }), i(1, 'Test block'),
            t({ '', '}' }), i(0)
        }
    ),
    s(
        {
            trig = 'testaccountrep',
            docstring = 'Boilerplate for running a test as a test account rep user',
        },
        {
            t('User accountRep = [SELECT Id FROM User WHERE Username = :TestDataFactory.ACCOUNT_REP_USERNAME];'),
            t({ '', 'System.runAs(accountRep) {' }),
            t({ '', '    ' }), i(1, 'Test block'),
            t({ '', '}' }), i(0)
        }
    )
}
