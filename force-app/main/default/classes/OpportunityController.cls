public class OpportunityController {

    // Method to create a new Opportunity
    public static void createOpportunity(String oppName, String stage, Decimal amount) {
        Opportunity newOpp = new Opportunity();
        newOpp.Name = oppName;
        newOpp.StageName = stage;
        newOpp.Amount = amount;
        
        try {
            insert newOpp;
            System.debug('Opportunity created successfully: ' + newOpp.Id);
        } catch (Exception e) {
            System.debug('Error creating Opportunity: ' + e.getMessage());
        }
    }

    // Method to update an existing Opportunity
    public static void updateOpportunity(String oppId, String newOppName, String newStage, Decimal newAmount) {
        Opportunity oppToUpdate = [SELECT Id, Name, StageName, Amount FROM Opportunity WHERE Id = :oppId LIMIT 1];
        oppToUpdate.Name = newOppName;
        oppToUpdate.StageName = newStage;
        oppToUpdate.Amount = newAmount;
        
        try {
            update oppToUpdate;
            System.debug('Opportunity updated successfully: ' + oppToUpdate.Id);
        } catch (Exception e) {
            System.debug('Error updating Opportunity: ' + e.getMessage());
        }
    }

    // Method to query Opportunities based on a condition
    public static List<Opportunity> getOpportunitiesByStage(String stage) {
        List<Opportunity> oppList = new List<Opportunity>();
        //something
        try {
            oppList = [SELECT Id, Name, StageName, Amount FROM Opportunity WHERE StageName = :stage];
            System.debug('Query returned ' + oppList.size() + ' opportunities.');
        } catch (Exception e) {
            System.debug('Error querying Opportunities: ' + e.getMessage());
        }
        //return
        return oppList;
    }
}