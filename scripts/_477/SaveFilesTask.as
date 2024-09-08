package _477
{
   import _11111._11110;
   import _120._119;
   import _97._118;
   
   public class SaveFilesTask extends _119
   {
      private var _11591:Array = null;
      
      private var _11590:Object = null;
      
      public function SaveFilesTask()
      {
         super();
      }
      
      override public function run() : void
      {
         super.run();
         this._11591 = this._11540 as Array;
         if(Boolean(this._11591) && this._11591.length > 0)
         {
            this._11591 = this._11591.concat();
            this._next();
         }
         else
         {
            fail("Input data error.");
         }
      }
      
      private function _next() : void
      {
         this._11590 = this._11591.shift();
         if(this._11590)
         {
            try
            {
               _118.save(this._11590.path,this._11590.data,true,"",false,this._next,this._11592);
            }
            catch(e:Error)
            {
               _11110.instance._11204._11132("SaveFilesTask::_next",e);
               _11592();
            }
         }
         else
         {
            this._2222 = this._11540;
            complete();
         }
      }
      
      private function _11592() : void
      {
         fail("Save file error",this._11590);
         this._next();
      }
   }
}

