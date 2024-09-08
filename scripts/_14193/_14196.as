package _14193
{
   public class _14196 extends _14197
   {
      private var _15199:Boolean = false;
      
      private var _15202:Vector.<_14197>;
      
      public function _14196(param1:String)
      {
         this._15202 = new Vector.<_14197>();
         super(param1);
      }
      
      protected function _15198() : void
      {
         if(!this._15199)
         {
            this._15199 = true;
            _2466();
         }
      }
      
      override protected function _2476() : void
      {
         var _loc1_:_14197 = null;
         super._2476();
         if(this._15199)
         {
            this._15199 = false;
            while(content.numChildren > 0)
            {
               content.removeChildAt(0);
            }
            for each(_loc1_ in this._15202)
            {
               content.addChild(_loc1_);
            }
         }
      }
      
      public function addElement(param1:_14197) : void
      {
         this.addElementAt(param1,this._2249);
      }
      
      public function addElementAt(param1:_14197, param2:int) : void
      {
         if(this._15202.indexOf(param1) == -1)
         {
            this._15202.splice(param2,0,param1);
            this._15198();
            _15201(param1);
         }
      }
      
      public function getElementAt(param1:int) : _14197
      {
         return this._15202[param1];
      }
      
      public function get _2249() : int
      {
         return this._15202.length;
      }
      
      public function removeElement(param1:_14197) : void
      {
         this.removeElementAt(this._15202.indexOf(param1));
      }
      
      public function removeElementAt(param1:int) : void
      {
         var _loc2_:_14197 = null;
         if(param1 >= 0 && param1 < this._2249)
         {
            _loc2_ = this._15202.splice(param1,1)[0];
            this._15198();
            _15200(_loc2_);
         }
      }
      
      override public function clone(param1:Boolean = true) : _14197
      {
         var _loc3_:int = 0;
         var _loc2_:_14196 = super.clone(param1) as _14196;
         if(param1)
         {
            _loc3_ = 0;
            while(_loc3_ < this._2249)
            {
               _loc2_.addElement(this.getElementAt(_loc3_).clone(true));
               _loc3_++;
            }
         }
         return _loc2_;
      }
   }
}

