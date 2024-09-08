package _1225
{
   import _1045.Label;
   import _1045.Scroller;
   import _1045._1047;
   import _1278._1277;
   import egret.core.ns_egret;
   import flash.display.GradientType;
   
   use namespace ns_egret;
   
   public class _840 extends _1277
   {
      public var _2491:Scroller;
      
      public var _2577:_1047;
      
      public var _6672:Label;
      
      public function _840()
      {
         super();
         this.states = ["normal","disabled","normalWithPrompt","disabledWithPrompt"];
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._2577 = new _1047();
         this._2577._6245 = 15;
         this._2577._6244 = 10;
         this._2491 = new Scroller();
         this._2491.left = 0;
         this._2491.top = 0;
         this._2491.right = 0;
         this._2491.bottom = 0;
         this._2491._6243 = 1;
         this._2491.skinName = _1257;
         this._2491._8287 = false;
         this._2491.viewport = this._2577;
         addElement(this._2491);
      }
      
      override protected function _2519() : void
      {
         if(_2080 == "disabledWithPrompt" || _2080 == "normalWithPrompt")
         {
            if(!this._6672)
            {
               this._9059();
            }
            if(!this._6672.parent)
            {
               addElement(this._6672);
            }
         }
         else if(Boolean(this._6672) && Boolean(this._6672.parent))
         {
            removeElement(this._6672);
         }
      }
      
      private function _9059() : void
      {
         this._6672 = new Label();
         this._6672._6080 = 1;
         this._6672.x = 1;
         this._6672.y = 1;
         this._6672.textColor = 11119017;
         this._6672.mouseChildren = false;
         this._6672.mouseEnabled = false;
         if(_6081)
         {
            _6081._8346();
         }
      }
      
      override public function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         graphics.clear();
         drawRoundRect(0,0,param1,param2,0,ns_egret::_9052[0],1,_9056(0,0,param1,param2),GradientType.LINEAR,null,{
            "x":1,
            "y":2,
            "w":param1 - 2,
            "h":param2 - 3,
            "r":0
         });
         drawRoundRect(1,2,param1 - 2,param2 - 3,0,16777215,1,_9056(1,2,param1 - 2,param2 - 3));
         _6107(1,0,param1,0,ns_egret::_9049[0]);
      }
   }
}

