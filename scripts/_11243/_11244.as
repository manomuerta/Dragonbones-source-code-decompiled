package _11243
{
   import _13._12;
   import _13._14;
   import _586._11247;
   import _652._654;
   import _658._661;
   import _783.CommandNotification;
   import _783.StageNotification;
   import _81._88;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class _11244 extends _11245
   {
      private var _11388:Vector.<_661>;
      
      private var _12641:Vector.<_661>;
      
      private var _11391:Boolean;
      
      private var _11389:Boolean;
      
      public function _11244()
      {
         super();
         this._11388 = new Vector.<_661>();
         this._12641 = new Vector.<_661>();
      }
      
      override public function start() : void
      {
         super.start();
         _12637 = true;
         _1567(new StageNotification(StageNotification.START_EDIT_BOUNDINGBOX));
         _14.setCursor(_12.AUTO,_11247.MOUSE_CURSOR_WEIGHT);
      }
      
      override public function stop() : void
      {
         super.stop();
         _14._1602(_12.CURSOR_BOUNDINGBOX_DELETE);
         _14._1602(_12.AUTO);
      }
      
      override protected function _4083(param1:MouseEvent) : void
      {
         var _loc2_:Boolean = false;
         if(_11381._4209 != null && !this._11391 && _11381._4266 != null)
         {
            this._12642();
            _11381._12643();
            _5157._3024();
            _11381._2466();
            _loc2_ = true;
         }
         super._4083(param1);
         if(_loc2_)
         {
            this.onMouseMove(param1);
         }
      }
      
      override public function _5167(param1:_661) : void
      {
         super._5167(param1);
         _4344._1897 = null;
      }
      
      override protected function _4063(param1:MouseEvent) : void
      {
         if(_11381._4209 == null)
         {
            _4342 = false;
            if(!this._11389)
            {
               _12638();
            }
         }
         else
         {
            super._4063(param1);
         }
         this._11391 = false;
         _4344._1897 = null;
         param1.stopImmediatePropagation();
      }
      
      override protected function onMouseMove(param1:MouseEvent) : void
      {
         super.onMouseMove(param1);
         _11381._5713[0] = null;
         _11381._5713[1] = null;
         if(_11383.vertices.length > 3)
         {
            this._11388.length = 0;
            if(_11381._4209 != null)
            {
               this._12647(_11381._4209);
               this._11390 = true;
            }
            else
            {
               _11381._12643();
               _11381._2466();
               this._11390 = false;
            }
         }
         this._11391 = true;
      }
      
      override protected function _11382() : void
      {
      }
      
      override protected function _12639() : void
      {
      }
      
      private function _12642() : void
      {
         var _loc4_:Boolean = false;
         var _loc5_:_661 = null;
         var _loc1_:Vector.<_661> = new Vector.<_661>();
         var _loc2_:int = 0;
         var _loc3_:int = int(_11383.vertices.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc5_ = _11383.vertices[_loc2_];
            if(this._12641.indexOf(_loc5_) == -1)
            {
               _loc1_.push(_loc5_);
            }
            _loc2_++;
         }
         var _loc6_:Point = _654._11392(Vector.<Point>(_loc1_));
         _2205 = new Matrix();
         _88._2013(_11381.vo.localTransform,_2205);
         _2205.tx = 0;
         _2205.ty = 0;
         var _loc7_:Point = _2205.transformPoint(_loc6_);
         var _loc8_:String = CommandNotification.CREATE_BOUNDINGBOX;
         _1567(new CommandNotification(_loc8_,{
            "_1837":_11381._1837,
            "_11299":_11381.vo,
            "_11278":_11383,
            "boundingBoxModel":_11381,
            "_11303":_loc1_,
            "_11302":_11383.vertices.concat(),
            "_11305":_loc6_,
            "_11304":_loc7_
         }));
      }
      
      public function set _11390(param1:Boolean) : void
      {
         if(this._11389 != param1)
         {
            this._11389 = param1;
            _14._1602(_12.CURSOR_BOUNDINGBOX_DELETE);
            _14._1602(_12.AUTO);
            if(this._11389)
            {
               _14.setCursor(_12.CURSOR_BOUNDINGBOX_DELETE,_11247.MOUSE_CURSOR_WEIGHT);
            }
            else
            {
               _14.setCursor(_12.AUTO,_11247.MOUSE_CURSOR_WEIGHT);
            }
         }
      }
      
      private function _12647(param1:_661) : void
      {
         if(_5157.isSelected(param1))
         {
            if(_11383.vertices.length - _5157._2889.length >= 3)
            {
               this._12644();
            }
            else
            {
               this._12645(param1);
            }
         }
         else
         {
            this._12645(param1);
         }
      }
      
      private function _12644() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:_661 = null;
         _11381._12643();
         this._12641.length = 0;
         _loc1_ = 0;
         _loc2_ = int(_5157._2889.length);
         while(_loc1_ < _loc2_)
         {
            _loc3_ = _5157._2889[_loc1_] as _661;
            if(_loc3_)
            {
               this._12640(_loc3_);
               this._12641.push(_loc3_);
            }
            _loc1_++;
         }
         _11381._2466();
      }
      
      private function _12645(param1:_661) : void
      {
         _11381._12643();
         this._12641.length = 0;
         this._12641.push(param1);
         this._12640(param1);
         _11381._2466();
      }
      
      private function _12640(param1:_661) : void
      {
         var _loc2_:int = 0;
         var _loc4_:_661 = null;
         var _loc5_:_661 = null;
         var _loc3_:int = int(_11383.vertices.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = _11383.vertices[_loc2_];
            if(_loc2_ < _loc3_ - 1)
            {
               _loc5_ = _11383.vertices[_loc2_ + 1];
            }
            else
            {
               _loc5_ = _11383.vertices[0];
            }
            if(_loc4_ == param1 || _loc5_ == param1)
            {
               this._11388.push(_loc4_,_loc5_);
            }
            _loc2_++;
         }
         _11381._12646(param1,this._11388);
      }
   }
}

