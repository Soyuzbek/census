"""Constants used by users app."""

URL = "http://212.42.101.115"

HEADERS = {'content-type': 'text/xml'}

FIELDS = {'name', 'surname', 'patronymic', 'gender', 'dateOfBirth', 'addressRegion', 'addressLocality', 'addressStreet',
          'addressHouse'}

BODY = """<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xro="http://x-road.eu/xsd/xroad.xsd" xmlns:iden="http://x-road.eu/xsd/identifiers" xmlns:prod="http://tunduk-seccurity-infocom.x-road.fi/producer">
           <soapenv:Header>
              <xro:protocolVersion>4.0</xro:protocolVersion>
              <xro:issue>?</xro:issue>
              <xro:id>IDYyIDE3MyAgIDMgIDk5ICA1OCAxNTIgMTQ1IDIwNSAxMjggMTkzICA1MyAgOTIgMjMzIDE3OCAgNjAgMjMyIAoyNDMgICA5ICA5NyAyMDMgMjAwIDIyNSAxMjkgIDE0IDE1OCAgMjQgIDk5ICA4MCAxNjYgMTc5IA==</xro:id>
              <xro:userId>KG12345678901</xro:userId>
              <xro:service iden:objectType="SERVICE">
                 <iden:xRoadInstance>central-server</iden:xRoadInstance>
                 <iden:memberClass>GOV</iden:memberClass>
                 <iden:memberCode>70000005</iden:memberCode>
                 <!--Optional:-->
                 <iden:subsystemCode>passport-service</iden:subsystemCode>
                 <iden:serviceCode>passportDataByPSN</iden:serviceCode>
                 <!--Optional:-->
                 <iden:serviceVersion>v1</iden:serviceVersion>
              </xro:service>
              <xro:client iden:objectType="SUBSYSTEM">
                 <iden:xRoadInstance>central-server</iden:xRoadInstance>
                 <iden:memberClass>GOV</iden:memberClass>
                 <iden:memberCode>70000010</iden:memberCode>
                 <!--Optional:-->
                 <iden:subsystemCode>nsk-service</iden:subsystemCode>
              </xro:client>
           </soapenv:Header>
           <soapenv:Body>
              <prod:passportDataByPSN>
                 <prod:request>
                    <prod:pin>{}</prod:pin>
                    <prod:series>{}</prod:series>
                    <prod:number>{}</prod:number>
                 </prod:request>
              </prod:passportDataByPSN>
           </soapenv:Body>
        </soapenv:Envelope>
        """
