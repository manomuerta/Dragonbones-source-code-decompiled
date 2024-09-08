package _1009
{
   import _1045.Button;
   import _1045.Group;
   import _1045.Label;
   import _1185._1197;
   import _127._171;
   import _1374.TextInput;
   import _97._125;
   import egret.utils.tr;
   import flash.events.Event;
   
   public class CrashWindow extends _171
   {
      private const WIDTH:int = 540;
      
      private const HEIGHT:int = 300;
      
      public var _11700:TextInput;
      
      public var _11697:Button;
      
      public var _11693:Button;
      
      public var _11698:Button;
      
      public var _11438:Button;
      
      private var _11843:Boolean;
      
      public function CrashWindow(param1:Boolean = false)
      {
         super();
         this.width = this.minWidth = this.WIDTH;
         this.height = this.minHeight = this.HEIGHT;
         title = tr("CrashWindow.title");
         this._11843 = param1;
         this._11697 = new Button();
         this._11693 = new Button();
         this._11698 = new Button();
         this._11438 = new Button();
         this._11700 = new TextInput();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         (_2512.layout as _1197).gap = 20;
         var _loc1_:Number = 5;
         var _loc2_:Number = 70;
         var _loc3_:Number = 6;
         var _loc4_:Group;
         (_loc4_ = new Group()).percentWidth = 100;
         var _loc5_:Label;
         (_loc5_ = new Label()).leading = _loc3_;
         _loc5_.percentWidth = _loc2_;
         _loc5_.text = tr("CrashWindow.restart.tip");
         this._11697.label = tr("CrashWindow.restart.btn");
         this._11697.right = _loc1_;
         _loc4_.addElement(_loc5_);
         _loc4_.addElement(this._11697);
         var _loc6_:Group;
         (_loc6_ = new Group()).percentWidth = 100;
         var _loc7_:Label;
         (_loc7_ = new Label()).leading = _loc3_;
         _loc7_.percentWidth = _loc2_;
         _loc7_.text = tr("CrashWindow.clearCache.tip");
         this._11693.label = tr("CrashWindow.clearCache.btn");
         this._11693.right = _loc1_;
         _loc6_.addElement(_loc7_);
         _loc6_.addElement(this._11693);
         var _loc8_:Group;
         (_loc8_ = _125._2413(20)).percentWidth = 100;
         var _loc9_:Label;
         (_loc9_ = new Label()).leading = _loc3_;
         _loc9_.percentWidth = _loc2_;
         _loc9_.text = tr("CrashWindow.upload.tip");
         this._11698.label = tr("CrashWindow.upload.btn");
         this._11698.right = _loc1_;
         var _loc10_:Label;
         (_loc10_ = new Label()).text = tr("CrashWindow.mail");
         var _loc11_:Group;
         (_loc11_ = new Group()).percentWidth = 100;
         var _loc12_:Group = _125._2414();
         _loc12_.addElement(_loc10_);
         _loc12_.addElement(this._11700);
         _loc11_.addElement(_loc12_);
         _loc11_.addElement(this._11698);
         _loc8_.addElement(_loc9_);
         _loc8_.addElement(_loc11_);
         var _loc13_:Group;
         (_loc13_ = _125._11551()).percentWidth = 100;
         _loc13_.percentHeight = 100;
         this._11438.label = tr("CrashWindow.close");
         _loc13_.addElement(this._11438);
         this._2512.addElement(_loc4_);
         this._2512.addElement(_loc6_);
         if(this._11843)
         {
            this._2512.addElement(_loc8_);
            this._11698.enabled = false;
            this._11700.addEventListener(Event.CHANGE,this._11842);
         }
         this._2512.addElement(_loc13_);
      }
      
      private function _11842(param1:Event) : void
      {
         var _loc2_:String = this._11700.text;
         var _loc3_:RegExp = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
         this._11698.enabled = _loc2_.search(_loc3_) != -1;
      }
      
      public function set sending(param1:Boolean) : void
      {
         _2512.enabled = param1;
      }
   }
}

