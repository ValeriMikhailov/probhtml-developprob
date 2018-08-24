package test.com.entity;

import com.fasterxml.jackson.annotation.JsonInclude;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.List;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class JTableJSONResponse<T> {
    @JsonProperty("Result")
    private String result;

    @JsonProperty("Records")
//    private List<T> records;
    private Object records;

//    @JsonProperty("Message")
//    private String message;

    @JsonProperty("TotalRecordCount")
    private int totalRecordCount;

//    public JTableJSONResponse(String result, List<T> records, String message, int totalRecordCount) {
//        super();
//        this.result = result;
//        this.records = records;
////        this.message = message;
//        this.totalRecordCount = totalRecordCount;
//    }


//    public JTableJSONResponse(String result, List<T> records, int totalRecordCount) {
//        this.result = result;
//        this.records = records;
//        this.totalRecordCount = totalRecordCount;
//    }

    public JTableJSONResponse() {

    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

//    public List<T> getRecords() {
//        return records;
//    }

    public Object getRecords() {
        return records;
    }

    public void setRecords(Object records) {
        this.records = records;
    }

    public void setRecords(List<T> records) {
        this.records = records;
    }

//    public String getMessage() {
//        return message;
//    }
//
//    public void setMessage(String message) {
//        this.message = message;
//    }

    public int getTotalRecordCount() {
        return totalRecordCount;
    }

    public void setTotalRecordCount(int totalRecordCount) {
        this.totalRecordCount = totalRecordCount;
    }

    public void setRecords() {
    }

    public void setTotalRecordCount() {
    }
}
