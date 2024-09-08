package _346
{
   import _11106._11105;
   import _11106._11108;
   import _11111._11110;
   import _1404._1407;
   import _24.Shortcut;
   import _472._12461;
   import _625._633;
   import _668._671;
   import _708._717;
   import _783.CommandNotification;
   import _93._92;
   import egret.utils.SystemInfo;
   import egret.utils.tr;
   
   public class _365 extends _92
   {
      public function _365()
      {
         this._12569 = _1407.getInstance(_12461);
         super();
      }
      
      override public function execute() : void
      {
         if(this._10704 == null)
         {
            return;
         }
         this._12569.callPaidFunction(1,this._save);
      }
      
      private function _save() : void
      {
         var _loc1_:_10606 = null;
         if(this._10704 == null || this._10704._2871 == null)
         {
            return;
         }
         if(this._10704._2871.isNew)
         {
            if(SystemInfo.isMacOS)
            {
               Shortcut.clear();
            }
            _11110.instance._11563._11130(_11108.Unknown);
            _11110.instance._11563._11139(_11105.SaveAsProject_IsNew,"1");
            (_1407.getInstance(_633) as _633)._3308();
         }
         else if(_2217._3297)
         {
            _2212._1567(new CommandNotification(CommandNotification.SHOW_TOOL_TIP,{
               "showText":tr("Tip.save.stopMeshEdit"),
               "type":_717.ANIMATE
            }));
         }
         else
         {
            this._10704._2871.save();
         }
         if(_2214 && _2214._1844 && _2214._1844 == this._10704)
         {
            _loc1_ = new _10606();
            _loc1_.execute();
         }
      }
      
      private function get _10704() : _671
      {
         if(_2223 is _671)
         {
            return _2223 as _671;
         }
         if(Boolean(_2214) && Boolean(_2214._1844))
         {
            return _2214._1844;
         }
         return null;
      }
   }
}

