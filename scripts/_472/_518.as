package _472
{
   import _1009._12484;
   import _1045.Button;
   import _11106._11108;
   import _11111._11110;
   import _1177.MenuEvent;
   import _1177.ResizeEvent;
   import _1177.UIEvent;
   import _12465._12464;
   import _1374.Application;
   import _1404._1407;
   import _1529._1528;
   import _1529._1530;
   import _6._9;
   import _648._12463;
   import _73.SymbolType;
   import _783.CommandNotification;
   import _783._12475;
   import _783._782;
   import _93._94;
   import _97._106;
   import _997._998;
   import egret.utils.SystemInfo;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class _518 extends _94
   {
      public var application:Application;
      
      private var _3752:_998;
      
      private var _13176:String;
      
      private var _13173:String;
      
      private var _13172:String;
      
      private var _13171:String;
      
      public function _518()
      {
         this._12594 = _1407.getInstance(_12463);
         this._12569 = _1407.getInstance(_12461);
         super();
      }
      
      override public function start() : void
      {
         super.start();
      }
      
      override protected function init() : void
      {
         this._3752 = new _998();
      }
      
      override protected function _1576() : void
      {
         if(_2214._3524)
         {
            this._3745(null);
         }
         else
         {
            _1565(_782.INIT_COMPLETE,this._3745,1);
         }
      }
      
      private function _3745(param1:_782) : void
      {
         this._3752.addEventListener(UIEvent.CREATION_COMPLETE,this._3739);
         this.application._3746.addElement(this._3752);
         this.application._9547.addElement(this._3752._2585);
         this.application.addEventListener(ResizeEvent.UI_RESIZE,this.onResize);
      }
      
      private function onResize(param1:ResizeEvent) : void
      {
         if(stage)
         {
            this._3752._13273(stage.stageWidth - 400);
         }
      }
      
      private function _3739(param1:UIEvent) : void
      {
         var _loc2_:Button = null;
         _1565(_782.UNDOABLE_CHANGED,this._3744);
         _1565(_782.REDOABLE_CHANGED,this._3743);
         _1565(_782.SAVEABLE_CHANGED,this._3742);
         _1565(_782.CURRENT_DOC_CHANGED,this._3741);
         _1565(_12475.LOGIN,this._12592);
         _1565(_12475.LOGOUT,this._12592);
         _1565(_12475.OFFLINE,this._12592);
         _1565(_12475.CHECK_FUNCTION_LIMITED,this._13174);
         this._3744(null);
         this._3743(null);
         this._3742(null);
         this._3741(null);
         for each(_loc2_ in this._3752._3763)
         {
            _loc2_.addEventListener(MouseEvent.CLICK,this._3753);
         }
         this._3752._3761.addEventListener(MouseEvent.CLICK,this._3762);
         this._3752._11597.addEventListener(MouseEvent.CLICK,this._11596);
         this._3752._3759.addEventListener(MenuEvent.ITEM_CLICK,this._3757);
         if(this._12594._3766)
         {
            this._3752._11595(this._12594.mail);
         }
         this._13176 = this._3752._3749.toolTip as String;
         this._13173 = this._3752._3756.toolTip as String;
         this._13172 = this._3752._3754.toolTip as String;
         this._13175();
      }
      
      private function _13174(param1:_12475) : void
      {
         this._13175();
      }
      
      public function _13175() : void
      {
         if(this._3752)
         {
            if(!this._12950._12951())
            {
               this._3752._3749.limited = this._3752._3756.limited = this._3752._3754.limited = false;
               this._3752._3749.toolTip = this._13176;
               this._3752._3756.toolTip = this._13173;
               this._3752._3754.toolTip = this._13172;
            }
         }
      }
      
      private function _12592(param1:_9) : void
      {
         switch(param1.type)
         {
            case _12475.LOGIN:
            case _12475.LOGOUT:
            case _12475.OFFLINE:
               if(this._12594._3766)
               {
                  this._3752._11595(this._12594.mail);
               }
               else
               {
                  this._3752.logout();
               }
         }
      }
      
      private function _3762(param1:MouseEvent) : void
      {
         _1567(new _12475(_12475.SHOW_LOGIN));
      }
      
      private function _11596(param1:MouseEvent) : void
      {
         var _loc2_:Point = null;
         if(this._12594._3766)
         {
            _loc2_ = new Point(0,this._3752._11597.height);
            _loc2_ = this._3752._11597.localToGlobal(_loc2_);
            _loc2_ = this._3752.globalToLocal(_loc2_);
            if(SystemInfo.isMacOS)
            {
               _loc2_.x -= 40;
               if(_1528.language == _1530.en_US || _1528.language == _1530.ru_RF)
               {
                  _loc2_.x -= 70;
               }
            }
            this._3752._3759.show(_loc2_.x,_loc2_.y);
         }
      }
      
      private function _3757(param1:MenuEvent) : void
      {
         var _loc3_:_12484 = null;
         var _loc2_:String = XML(param1.item).@id;
         switch(_loc2_)
         {
            case "changePassword":
               _loc3_ = new _12484();
               _loc3_.open();
               break;
            case "logout":
               this._12569.logout(1,null,true);
         }
      }
      
      private function _3753(param1:MouseEvent) : void
      {
         if(param1.target.id == CommandNotification.OPEN_TRELLO)
         {
            _1567(new CommandNotification(CommandNotification.OPEN_TRELLO,_106.OPEN_TRELLO));
         }
         _11110.instance._11593(param1.currentTarget.id,_11108.AppToolBar);
         _1567(new CommandNotification(param1.currentTarget.id));
      }
      
      private function _3744(param1:_782) : void
      {
         this._3752._3764.enabled = _2217._1653;
      }
      
      private function _3743(param1:_782) : void
      {
         this._3752._3765.enabled = _2217._1654;
      }
      
      private function _3742(param1:_782) : void
      {
         var _loc2_:Boolean = false;
         if(_2214 && _2214._1844 && Boolean(_2214._1844._2871))
         {
            _loc2_ = _2214._1844._2871.isNew;
         }
      }
      
      private function _3741(param1:_782) : void
      {
         var _loc2_:Boolean = false;
         if(this._2214 && this._2214._1844 && this._2214._1844._2871 && this._2214._1844._2871._2865 && this._2214._1844._2871._2865._1811 == SymbolType.COMIC)
         {
            _loc2_ = true;
         }
         this._3752._11144.enabled = _2214._3740;
         this._3752._3758.visible = this._3752._3748.visible = false;
         this._3752._3758.includeInLayout = this._3752._3758.includeInLayout = false;
      }
      
      private function get _12950() : _12464
      {
         return _1407.getInstance(_12464) as _12464;
      }
   }
}

