
package com.foshan.messageWS;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>anonymous complex type�� Java �ࡣ
 * 
 * <p>����ģʽƬ��ָ�������ڴ����е�Ԥ�����ݡ�
 * 
 * <pre>
 * &lt;complexType&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="GetAllInfoResult" type="{http://tempuri.org/}RegistryInfo" minOccurs="0"/&gt;
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
    "getAllInfoResult"
})
@XmlRootElement(name = "GetAllInfoResponse")
public class GetAllInfoResponse {

    @XmlElement(name = "GetAllInfoResult")
    protected RegistryInfo getAllInfoResult;

    /**
     * ��ȡgetAllInfoResult���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link RegistryInfo }
     *     
     */
    public RegistryInfo getGetAllInfoResult() {
        return getAllInfoResult;
    }

    /**
     * ����getAllInfoResult���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link RegistryInfo }
     *     
     */
    public void setGetAllInfoResult(RegistryInfo value) {
        this.getAllInfoResult = value;
    }

}
