
package com.foshan.messageWS;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>anonymous complex type的 Java 类。
 * 
 * <p>以下模式片段指定包含在此类中的预期内容。
 * 
 * <pre>
 * &lt;complexType&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="report2DESResult" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {
    "report2DESResult"
})
@XmlRootElement(name = "report2DESResponse")
public class Report2DESResponse {

    protected String report2DESResult;

    /**
     * 获取report2DESResult属性的值。
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getReport2DESResult() {
        return report2DESResult;
    }

    /**
     * 设置report2DESResult属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setReport2DESResult(String value) {
        this.report2DESResult = value;
    }

}
