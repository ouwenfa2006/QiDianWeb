
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
 *         &lt;element name="GetAllInfo2Result" type="{http://tempuri.org/}RegistryInfo2" minOccurs="0"/&gt;
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
    "getAllInfo2Result"
})
@XmlRootElement(name = "GetAllInfo2Response")
public class GetAllInfo2Response {

    @XmlElement(name = "GetAllInfo2Result")
    protected RegistryInfo2 getAllInfo2Result;

    /**
     * ��ȡgetAllInfo2Result���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link RegistryInfo2 }
     *     
     */
    public RegistryInfo2 getGetAllInfo2Result() {
        return getAllInfo2Result;
    }

    /**
     * ����getAllInfo2Result���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link RegistryInfo2 }
     *     
     */
    public void setGetAllInfo2Result(RegistryInfo2 value) {
        this.getAllInfo2Result = value;
    }

}
