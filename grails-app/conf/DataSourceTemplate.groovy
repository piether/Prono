dataSource {
	pooled = true
	driverClassName = "org.hsqldb.jdbcDriver"
	username = "sa"
	password = ""
    dbunitXmlType = "structured"
}
hibernate {
    cache.use_second_level_cache=true
    cache.use_query_cache=true
    cache.provider_class='net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
	development {
		dataSource {
			dbCreate = "create-drop" // one of 'create', 'create-drop','update'
			url = "jdbc:hsqldb:mem:devDB"
            initialData = "data/dev/data.xml"
            initialOperation = "CLEAN_INSERT"
		}
	}
	test {
		dataSource {
			dbCreate = "update"
			url = "jdbc:hsqldb:mem:testDb"
		}
	}
	production {
		dataSource {
			dbCreate = "update"
			url = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
            driverClassName = "com.mysql.jdbc.Driver"
            username = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
            password = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
		}
	}
}
