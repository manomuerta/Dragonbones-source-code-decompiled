package _12491
{
   import _1033._12503;
   import _1045.Button;
   import _1045.Group;
   import _1045.Label;
   import _1045._1105;
   import _1185._1188;
   import _1185._1197;
   import _12465._12464;
   import _127._171;
   import _12927._12928;
   import _1404._1407;
   import _1529._1528;
   import _1529._1530;
   import _472._12461;
   import _97._125;
   import egret.utils.SystemInfo;
   import egret.utils.tr;
   import flash.desktop.Clipboard;
   import flash.desktop.ClipboardFormats;
   import flash.display.NativeWindowType;
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   
   public class _12498 extends _171
   {
      public static const STATUS_CHECKING:int = 1;
      
      public static const STATUS_FAIL:int = 2;
      
      private var _mode:int;
      
      private var _url:String;
      
      private var _13014:String;
      
      private var _13047:Label;
      
      public function _12498(param1:int, param2:Object)
      {
         super();
         this._mode = param1;
         switch(this._mode)
         {
            case _12461._12966:
               this._url = param2["imgurl"];
               this.title = tr("Pay.weixin.title");
               break;
            case _12461._12967:
               this._url = param2["url"];
               this.title = tr("Pay.ali.title");
               break;
            case _12461._12965:
               this.title = tr("Pay.paypal.title");
               this._url = param2["url"];
         }
         this._13014 = param2["order_num"];
         this.width = 480;
         this.maximizable = false;
         this.minimizable = false;
         this.resizable = false;
         this.type = NativeWindowType.UTILITY;
      }
      
      override protected function _2438() : void
      {
         var _loc1_:Label = null;
         var _loc2_:_1105 = null;
         var _loc5_:_12928 = null;
         super._2438();
         closeButton.visible = true;
         (_2512.layout as _1197)._2401 = _1188.CENTER;
         switch(this._mode)
         {
            case _12461._12966:
               this.title = tr("Pay.weixin.title");
               _loc1_ = _125._2400(tr("Pay.weixin.desc"));
               _loc2_ = new _1105();
               _loc5_ = new _12928();
               _loc5_.encode(this._url);
               _loc2_.source = _loc5_.bitmapData;
               break;
            case _12461._12967:
               this.title = tr("Pay.ali.title");
               _loc1_ = _125._2400(tr("Pay.ali.desc"));
               navigateToURL(new URLRequest(this._url),"_blank");
               break;
            case _12461._12965:
               this.title = tr("Pay.paypal.title");
               _loc1_ = _125._2400(tr("Pay.paypal.desc"));
               navigateToURL(new URLRequest(this._url),"_blank");
         }
         if(!SystemInfo.isMacOS && _1528.language == _1530.zh_CN)
         {
            _loc1_.fontFamily = "微软雅黑";
         }
         _2512.addElement(_loc1_);
         if(_loc2_ != null)
         {
            _2512.addElement(_loc2_);
         }
         var _loc3_:Group = _125._2414(-10);
         _loc3_.addElement(_125._12836(tr("Pay.pay.after")));
         var _loc4_:Button;
         (_loc4_ = new Button()).label = tr("Pay.pay.complete");
         _loc4_.skinName = _12503;
         _loc4_.addEventListener(MouseEvent.CLICK,this._13045);
         _loc3_.addElement(_loc4_);
         _2512.addElement(_loc3_);
         this._13047 = _125._12836(" ");
         _2512.addElement(this._13047);
         _loc1_ = _125._12836(tr("Pay.pay.copyOrder",this._13014));
         _loc1_.alpha = 0.5;
         _loc1_.mouseEnabled = true;
         _loc1_.buttonMode = true;
         _loc1_.addEventListener(MouseEvent.CLICK,this._13046);
         _2512.addElement(_loc1_);
         _loc1_ = _125._12836(tr("Pay.pay.contact"));
         _loc1_.alpha = 0.5;
         _2512.addElement(_loc1_);
      }
      
      private function _13046(param1:MouseEvent) : void
      {
         Clipboard.generalClipboard.setData(ClipboardFormats.TEXT_FORMAT,this._13014);
      }
      
      public function _13011(param1:int) : void
      {
         switch(param1)
         {
            case STATUS_CHECKING:
               this._13047.text = tr("Pay.order.check");
               break;
            case STATUS_FAIL:
               this._13047.text = tr("Pay.order.noPay");
         }
      }
      
      private function _13045(param1:MouseEvent) : void
      {
         this._12950._12998();
         this._13011(STATUS_CHECKING);
      }
      
      private function get _12950() : _12464
      {
         return _1407.getInstance(_12464) as _12464;
      }
   }
}

