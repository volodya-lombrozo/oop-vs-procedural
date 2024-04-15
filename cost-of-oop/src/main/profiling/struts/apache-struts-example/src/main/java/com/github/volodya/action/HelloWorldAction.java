package com.github.volodya.action;

import com.github.volodya.model.MessageStore;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class HelloWorldAction extends ActionSupport {

    private MessageStore store;

    @Override
    public String execute() {
        this.store = new MessageStore();
        return Action.SUCCESS;
    }

    public MessageStore getStore() {
        return this.store;
    }
}
