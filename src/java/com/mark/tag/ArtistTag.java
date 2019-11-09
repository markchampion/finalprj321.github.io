/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mark.tag;

import com.mark.dao.ArtistDAO;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 *
 * @author PC
 */
public class ArtistTag extends SimpleTagSupport {

    private int songID;

    /**
     * Called by the container to invoke this tag. The implementation of this
     * method is provided by the tag library developer, and handles all tag
     * processing, body iteration, etc.
     */
    @Override
    public void doTag() throws JspException {
        JspWriter out = getJspContext().getOut();
        
        try {
            // TODO: insert code to write html before writing the body content.
            // e.g.:
            //
            // out.println("<strong>" + attribute_1 + "</strong>");
            // out.println("    <blockquote>");

            List<com.mark.model.Artist> list = new LinkedList<>();
            list = new ArtistDAO().getArtistList(songID);
            for (com.mark.model.Artist artist : list) {
                out.println("<a class='white' href='/PRJ321_FINAL_PROJECT/artist-page.jsp?artistID="+artist.getID()+"'>"+artist.getNickName()+"</a> ");
                JspFragment f = getJspBody();
                if (f != null) {
                    f.invoke(out);
                }
            }
            
            // TODO: insert code to write html after writing the body content.
            // e.g.:
            //
            // out.println("    </blockquote>");
        } catch (java.io.IOException ex) {
            throw new JspException("Error in ArtistTag tag", ex);
        }
    }

    public void setSongID(int SongID) {
        this.songID = SongID;
    }
    
}
