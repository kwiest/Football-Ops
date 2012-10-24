class FootballOps.SchoolsController extends Batman.Controller
    routingKey: 'schools'
    searchQueryError: false

    index: (params) ->
        page = params.page or 1
        paginator = new FootballOps.SchoolPaginator page: page
        @set 'paginatedSchools', paginator

    navigateToPage: (link) ->
        page = $(link).html() or 1
        @redirect "/schools?page=#{page}"

    show: (params) ->
        school = FootballOps.School.find parseInt(params.id, 10), (err) ->
            throw err if err
        emailer = new FootballOps.UserEmailer
        emailer.setEmailAddressesForGroup 'school', params.id
        @set 'school', school
        @set 'userEmailView', new FootballOps.UserEmailerView emailer: emailer

    search: (params) ->
        FootballOps.School.search params.q, (err, records) =>
            throw err if err
            @set 'searchSchools', records
