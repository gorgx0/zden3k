@GrabConfig(systemClassLoader=true)
@Grab('org.mariadb.jdbc:mariadb-java-client:2.2.5')
import groovy.sql.Sql

def sql = Sql.newInstance("jdbc:mariadb://localhost/youtravel",'youtravel','PASS','org.mariadb.jdbc.Driver')
def countryInsertSql = 'insert into Countries (Name, Code, ytID) values (?,?,?)'
def destinationInsertSql = 'INSERT INTO Destinations (name, ytID, countryId,ISO_code_1,ISO_code_2,ISO_code_3) VALUES (?,?,?,?,?,?);'
def resortInserSql = 'insert into Resorts(Name, ytID, destinationId) values(?,?,?)'
def HtSearchRq = new XmlSlurper().parse("You_travel_countries_and_destinations.xml")

HtSearchRq.'*'.findAll {
    node -> node.name() == 'Country'
}.each { country ->
    println "Adding country: ${country.@Name.text()}"
    def countryInsertParams = [country.@Name.text(),country.@Code.text(),country.@ID.text()]
    def countryInsertResult = sql.executeInsert(countryInsertSql,countryInsertParams)
    def countryId = countryInsertResult[0][0]
    country.Destination.each {
        destination ->
            println "Adding destination: ${destination.@name.text()}"
            def isoCode1 = destination.ISO_Codes.@Code_1?.text()
            def isoCode2 = destination.ISO_Codes.@Code_2?.text()
            def isoCode3 = destination.ISO_Codes.@Code_3?.text()
            def destinationInsertParams = [destination.@name.text(), destination.@ID.text(), countryId, isoCode1, isoCode2, isoCode3]
            def destinationInsertresult = sql.executeInsert(destinationInsertSql, destinationInsertParams)
            def destinationId = destinationInsertresult[0][0]
        destination.Resort.each {
            resort ->
                println "Adding resort: ${resort.text()}"
                def resortInsertParams = [resort.text(),resort.@ID.text(), destinationId]
                sql.executeInsert(resortInserSql,resortInsertParams)

        }
    }
}
