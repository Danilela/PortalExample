/*
*
* Copyright 2005 AgileTec s.r.l. (http://www.agiletec.it) All rights reserved.
*
* This file is part of jAPS software.
* jAPS is a free software; 
* you can redistribute it and/or modify it
* under the terms of the GNU General Public License (GPL) as published by the Free Software Foundation; version 2.
* 
* See the file License for the specific language governing permissions   
* and limitations under the License
* 
* 
* 
* Copyright 2005 AgileTec s.r.l. (http://www.agiletec.it) All rights reserved.
*
*/
package com.agiletec.plugins.jacms.aps.system.services.dispenser;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.agiletec.aps.system.common.entity.model.attribute.AttributeInterface;
import com.agiletec.aps.system.common.entity.model.attribute.AttributeRole;
import com.agiletec.plugins.jacms.aps.system.services.content.model.Content;

/**
 * Represents the rendering information of a content.
 * The enhanced object is cached by alphanumeric identifier produced 
 * by the identifier of the content, the model an the rendering lang.
 * @author E.Santoboni
 */
public class ContentRenderizationInfo implements Serializable {
	
	private static final long serialVersionUID = 2514275355950411866L;
	
	protected ContentRenderizationInfo() {}
	
	public ContentRenderizationInfo(Content content, 
			String tempRenderedContent, long modelId, String renderingLang, List<AttributeRole> roles) {
		if (null != content) {
			this._contentId = content.getId();
			this._contentType = content.getTypeCode();
		}
		this._tempRenderedContent = tempRenderedContent;
		this._renderingLang = renderingLang;
		this._modelId = modelId;
		if (null == roles) return;
		for (int i = 0; i < roles.size(); i++) {
			AttributeRole role = roles.get(i);
			AttributeInterface attribute = content.getAttributeByRole(role.getName());
			if (null != attribute) {
				this.getAttributeValues().put(role.getName(), attribute.getValue());
			}
		}
	}
	
	@Override
	public ContentRenderizationInfo clone() {
		ContentRenderizationInfo clone = new ContentRenderizationInfo();
		clone.setContentId(this.getContentId());
		clone.setContentType(this.getContentType());
		clone.setModelId(this.getModelId());
		clone.setTempRenderedContent(this.getTempRenderedContent());
		clone.setRenderingLang(this.getRenderingLang());
		clone.getAttributeValues().putAll(this.getAttributeValues());
		return clone;
	}
	
	public String getContentId() {
		return _contentId;
	}
	protected void setContentId(String contentId) {
		this._contentId = contentId;
	}
	
	public String getContentType() {
		return _contentType;
	}
	protected void setContentType(String contentType) {
		this._contentType = contentType;
	}
	
	/**
	 * Return the first rendered content.
	 * This string contains all link in symbolic form. 
	 * The symbolic links will be resolved by the manager LinkResolved.
	 * @return The first rendered content.
	 */
	protected String getTempRenderedContent() {
		return _tempRenderedContent;
	}
	
	/**
	 * Set the first rendered content.
	 * This string contains all link in symbolic form. 
	 * The symbolic links will be resolved by the manager LinkResolved.
	 * @param tempRenderedContent The first rendered content.
	 */
	protected void setTempRenderedContent(String tempRenderedContent) {
		this._tempRenderedContent = tempRenderedContent;
	}

	/**
	 * Return the final rendered content.
	 * This string contains all link resolved.
	 * @return The final rendered content.
	 */
	public String getRenderedContent() {
		return _renderedContent;
	}
	
	/**
	 * Set the final rendered content.
	 * This string has to contains all link resolved.
	 * @param renderedContent The final rendered content.
	 */
	public void setRenderedContent(String renderedContent) {
		this._renderedContent = renderedContent;
	}
	
	public String getRenderingLang() {
		return _renderingLang;
	}
	protected void setRenderingLang(String renderingLang) {
		this._renderingLang = renderingLang;
	}
	
	public long getModelId() {
		return _modelId;
	}
	protected void setModelId(long modelId) {
		this._modelId = modelId;
	}
	
	public Map<String, Object> getAttributeValues() {
		return _attributeValues;
	}
	public void setAttributeValues(Map<String, Object> attributeValues) {
		this._attributeValues = attributeValues;
	}
	
	private String _contentId;
	private String _contentType;
	
	private String _tempRenderedContent;
	private String _renderedContent;
	private String _renderingLang;
	private long _modelId;
	
	private Map<String, Object> _attributeValues = new HashMap<String, Object>();
	
}
