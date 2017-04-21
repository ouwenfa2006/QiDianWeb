
package com.foshan.messageWS;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
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
 *         &lt;element name="RECSMSExResult" type="{http://tempuri.org/}ArrayOfMOBody" minOccurs="0"/&gt;
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
    "recsmsExResult"
})
@XmlRootElement(name = "RECSMSExResponse")
public class RECSMSExResponse {

    @XmlElement(name = "RECSMSExResult")
    protected ArrayOfMOBody recsmsExResult;

    /**
     * 获取recsmsExResult属性的值。
     * 
     * @return
     *     possible object is
     *     {@link ArrayOfMOBody }
     *     
     */
    public ArrayOfMOBody getRECSMSExResult() {
        return recsmsExResult;
    }

    /**
     * 设置recsmsExResult属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link ArrayOfMOBody }
     *     
     */
    public void setRECSMSExResult(ArrayOfMOBody value) {
        this.recsmsExResult = value;
    }

}
