public class zendesktickets {
    public static void getTickets(){
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:heysfzendesk/api/v2/tickets.json');
        req.setMethod('GET');
        Http http = new Http();
        HTTPResponse res = http.send(req);
        system.debug(res.getBody());
        JsonParser allTickets = (JsonParser)JSON.deserialize(res.getBody(), JsonParser.class);
		list<case> allCase = new list<case>();
        for(JsonParser.tickets t:allTickets.tickets)
        {
            case c = new case();
            c.Status = t.status;
            c.Subject = t.subject;
            c.Description = t.description;
            c.Origin = 'Phone';
            allCase.add(c);
        }
        upsert allCase;
    }  
}