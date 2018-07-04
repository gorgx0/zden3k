@GrabConfig(systemClassLoader=true)
@Grab('org.mariadb.jdbc:mariadb-java-client:2.2.5')
import groovy.sql.Sql

def sql = Sql.newInstance("jdbc:mariadb://localhost/youtravel",'youtravel','PASS','org.mariadb.jdbc.Driver')
def hotelInsertSql = 'insert into Hotels(name, hotelId, latitude, longitude, resort_name, resort_id, destination_name, destinatio_id, iso_code_1, iso_code_2, iso_code_3, country_code, country_id, country_name ) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)'
def htsearchrq = new XmlSlurper().parse("hotel_list_by_dstn.xml")

htsearchrq.'*'.findAll {
    node -> node.name() == 'country'
}.each { country ->
    country.destination.each {
        destination ->
        destination.resort.each {
            resort -> resort.hotel.each {
                hotel ->
                    def params = [
                            hotel.hotel_name.text(),
                            hotel.hotel_id.text(),
                            hotel.mapping.latitude.text(),
                            hotel.mapping.longitude.text(),
                            resort.resort_name.text(),
                            resort.@id?.text(),
                            destination.@name.text(),
                            destination.@id.text(),
                            destination.iso_codes.@code_1?.text(),
                            destination.iso_codes.@code_2?.text(),
                            destination.iso_codes.@code_3?.text(),
                            country.@code.text(),
                            country.@id.text(),
                            country.@name.text()
                    ]
                    println params
                    sql.executeInsert(hotelInsertSql,params)
            }

        }
    }
}
