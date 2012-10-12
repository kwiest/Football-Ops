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
