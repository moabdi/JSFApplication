package metier.eps.jsf.exception;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Map;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.servlet.ServletException;

import metier.eps.messages.BuildMessage;



public class ErrorHandler {

	private static final long serialVersionUID = 3123969847287207137L;
    private static final String BEAN_NAME = ErrorHandler.class.getName();
    private String errConnection = "";

    public String getInfoMessage() {
        return "An unexpected processing error has occurred. Please cut and paste the following information" + " into an email and send it to <b>" +
        "support.eps@bits.ma" + "</b>. or technical support staff at <b>" +
        "EPS Support Address" + "</b>.";
    }

    public String getStackTrace() {
        FacesContext context = FacesContext.getCurrentInstance();
        Map requestMap = context.getExternalContext().getRequestMap();
        Throwable ex = (Throwable) requestMap.get("javax.servlet.error.exception");

        StringWriter writer = new StringWriter();
        PrintWriter pw = new PrintWriter(writer);
        fillStackTrace(ex, pw);

        return writer.toString();
    }

    private void fillStackTrace(Throwable ex, PrintWriter pw) {
        if (null == ex) {
            return;
        }

        ex.printStackTrace(pw);

        if (ex instanceof ServletException) {
            Throwable cause = ((ServletException) ex).getRootCause();

            if (null != cause) {
                pw.println("Root Cause:");
                fillStackTrace(cause, pw);
            }
        } else {
            Throwable cause = ex.getCause();

            if (null != cause) {
                pw.println("Cause:");
                fillStackTrace(cause, pw);
            }
        }
    }

	public String getErrConnection() {
		errConnection = BuildMessage.getMessageResourceString("i18n.messages", "Gen_no_dataconnect"
				, null, FacesContext.getCurrentInstance().getViewRoot().getLocale());
		return errConnection;
	}

	public void setErrConnection(String errConnection) {
		this.errConnection = errConnection;
	}

	
	

} 