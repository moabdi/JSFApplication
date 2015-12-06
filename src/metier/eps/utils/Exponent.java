package metier.eps.utils;

import java.util.ArrayList;
import java.util.List;

import javax.faces.model.SelectItem;

import metier.appLists.ApplicationLists;

public class Exponent {

	private List<SelectItem> exponentListSI;
	private Integer exponent = 2;

	public Integer refreshExponent(String currency) {
		/*exponentListSI = new ArrayList<SelectItem>();
		if (currency != null) {
			exponentListSI = new ArrayList<SelectItem>();
			ApplicationLists.initExponentListSI(currency);
			List<SelectItem> tmpSI = new ArrayList<SelectItem>();
			tmpSI = ApplicationLists.exponentListSI;
			String tmp1;
			for (SelectItem tmpSelectItem : ApplicationLists.exponentListSI) {
				tmp1 = tmpSelectItem.getValue().toString();
				exponentListSI.add(new SelectItem(tmp1.trim()));
				setExponent(Integer.valueOf(tmp1).intValue());
				if (this.exponent != 0)
					break;
			}
		}*/
		return (exponent);

	}

	public List<SelectItem> getExponentListSI() {
		return exponentListSI;
	}

	public void setExponentListSI(List<SelectItem> exponentListSI) {
		this.exponentListSI = exponentListSI;
	}

	public Integer getExponent() {
		return exponent;
	}

	public void setExponent(Integer exponent) {
		this.exponent = exponent;
	}

}
