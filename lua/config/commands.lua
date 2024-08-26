local cmds = {
  {
    name = "ShowRtpPopup",
    fn = function()
      require("xxx.info.show").rtp_popup()
    end,
  },
}

commands(cmds)
