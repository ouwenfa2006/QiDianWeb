
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
 *         &lt;element name="SetGaoDuanResult" type="{http://www.w3.org/2001/XMLSchema}double"/&gt;
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
    "setGaoDuanResult"
})
@XmlRootElement(name = "SetGaoDuanResponse")
public class SetGaoDuanResponse {

    @XmlElement(name = "SetGaoDuanResult")
    protected double setGaoDuanResult;

    /**
     * 获取setGaoDuanResult属性的值。
     * 
     */
    public double getSetGaoDuanResult() {
        return setGaoDuanResult;
    }

    /**
     * 设置setGaoDuanResult属性的值。
     * 
     */
    public void setSetGaoDuanResult(double value) {
        this.setGaoDuanResult = value;
    }

}
